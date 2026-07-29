# Explore: explore_0733
# Auto-generated LookML Explore File

include: "/views/domain_50/view_02200.view.lkml"
include: "/views/domain_02/view_02202.view.lkml"
include: "/views/domain_03/view_02203.view.lkml"
include: "/views/domain_04/view_02204.view.lkml"

explore: explore_0733 {
  label: "Explore Explore 0733"
  description: "Comprehensive analytics explore joining base view_02200 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02200
  
  always_filter: {
    filters: [view_02200.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02200.created_at_date: "7 days"]
    unless: [view_02200.id, view_02200.status]
  }

  join: view_02202 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02200.user_id} = ${view_02202.id} ;;
    required_joins: []
  }

  join: view_02203 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02200.account_id} = ${view_02203.account_id} ;;
    required_joins: [view_02202]
  }

  join: view_02204 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02200.category} = ${view_02204.category} ;;
  }

  access_filter: {
    field: view_02200.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02200.is_deleted} = false ;;
}
