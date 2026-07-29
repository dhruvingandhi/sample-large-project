# Explore: explore_0647
# Auto-generated LookML Explore File

include: "/views/domain_42/view_01942.view.lkml"
include: "/views/domain_44/view_01944.view.lkml"
include: "/views/domain_45/view_01945.view.lkml"
include: "/views/domain_46/view_01946.view.lkml"

explore: explore_0647 {
  label: "Explore Explore 0647"
  description: "Comprehensive analytics explore joining base view_01942 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01942
  
  always_filter: {
    filters: [view_01942.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01942.created_at_date: "7 days"]
    unless: [view_01942.id, view_01942.status]
  }

  join: view_01944 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01942.user_id} = ${view_01944.id} ;;
    required_joins: []
  }

  join: view_01945 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01942.account_id} = ${view_01945.account_id} ;;
    required_joins: [view_01944]
  }

  join: view_01946 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01942.category} = ${view_01946.category} ;;
  }

  access_filter: {
    field: view_01942.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01942.is_deleted} = false ;;
}
