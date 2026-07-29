# Explore: explore_3647
# Auto-generated LookML Explore File

include: "/views/domain_42/view_10942.view.lkml"
include: "/views/domain_44/view_10944.view.lkml"
include: "/views/domain_45/view_10945.view.lkml"
include: "/views/domain_46/view_10946.view.lkml"

explore: explore_3647 {
  label: "Explore Explore 3647"
  description: "Comprehensive analytics explore joining base view_10942 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10942
  
  always_filter: {
    filters: [view_10942.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10942.created_at_date: "7 days"]
    unless: [view_10942.id, view_10942.status]
  }

  join: view_10944 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10942.user_id} = ${view_10944.id} ;;
    required_joins: []
  }

  join: view_10945 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10942.account_id} = ${view_10945.account_id} ;;
    required_joins: [view_10944]
  }

  join: view_10946 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10942.category} = ${view_10946.category} ;;
  }

  access_filter: {
    field: view_10942.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10942.is_deleted} = false ;;
}
