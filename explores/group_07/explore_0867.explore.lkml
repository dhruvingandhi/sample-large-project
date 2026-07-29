# Explore: explore_0867
# Auto-generated LookML Explore File

include: "/views/domain_02/view_02602.view.lkml"
include: "/views/domain_04/view_02604.view.lkml"
include: "/views/domain_05/view_02605.view.lkml"
include: "/views/domain_06/view_02606.view.lkml"

explore: explore_0867 {
  label: "Explore Explore 0867"
  description: "Comprehensive analytics explore joining base view_02602 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02602
  
  always_filter: {
    filters: [view_02602.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02602.created_at_date: "7 days"]
    unless: [view_02602.id, view_02602.status]
  }

  join: view_02604 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02602.user_id} = ${view_02604.id} ;;
    required_joins: []
  }

  join: view_02605 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02602.account_id} = ${view_02605.account_id} ;;
    required_joins: [view_02604]
  }

  join: view_02606 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02602.category} = ${view_02606.category} ;;
  }

  access_filter: {
    field: view_02602.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02602.is_deleted} = false ;;
}
