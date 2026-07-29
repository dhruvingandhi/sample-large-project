# Explore: explore_1647
# Auto-generated LookML Explore File

include: "/views/domain_42/view_04942.view.lkml"
include: "/views/domain_44/view_04944.view.lkml"
include: "/views/domain_45/view_04945.view.lkml"
include: "/views/domain_46/view_04946.view.lkml"

explore: explore_1647 {
  label: "Explore Explore 1647"
  description: "Comprehensive analytics explore joining base view_04942 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04942
  
  always_filter: {
    filters: [view_04942.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04942.created_at_date: "7 days"]
    unless: [view_04942.id, view_04942.status]
  }

  join: view_04944 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04942.user_id} = ${view_04944.id} ;;
    required_joins: []
  }

  join: view_04945 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04942.account_id} = ${view_04945.account_id} ;;
    required_joins: [view_04944]
  }

  join: view_04946 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04942.category} = ${view_04946.category} ;;
  }

  access_filter: {
    field: view_04942.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04942.is_deleted} = false ;;
}
