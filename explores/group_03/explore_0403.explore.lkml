# Explore: explore_0403
# Auto-generated LookML Explore File

include: "/views/domain_10/view_01210.view.lkml"
include: "/views/domain_12/view_01212.view.lkml"
include: "/views/domain_13/view_01213.view.lkml"
include: "/views/domain_14/view_01214.view.lkml"

explore: explore_0403 {
  label: "Explore Explore 0403"
  description: "Comprehensive analytics explore joining base view_01210 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01210
  
  always_filter: {
    filters: [view_01210.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01210.created_at_date: "7 days"]
    unless: [view_01210.id, view_01210.status]
  }

  join: view_01212 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01210.user_id} = ${view_01212.id} ;;
    required_joins: []
  }

  join: view_01213 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01210.account_id} = ${view_01213.account_id} ;;
    required_joins: [view_01212]
  }

  join: view_01214 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01210.category} = ${view_01214.category} ;;
  }

  access_filter: {
    field: view_01210.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01210.is_deleted} = false ;;
}
