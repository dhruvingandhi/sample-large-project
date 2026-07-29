# Explore: explore_2558
# Auto-generated LookML Explore File

include: "/views/domain_25/view_07675.view.lkml"
include: "/views/domain_27/view_07677.view.lkml"
include: "/views/domain_28/view_07678.view.lkml"
include: "/views/domain_29/view_07679.view.lkml"

explore: explore_2558 {
  label: "Explore Explore 2558"
  description: "Comprehensive analytics explore joining base view_07675 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07675
  
  always_filter: {
    filters: [view_07675.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07675.created_at_date: "7 days"]
    unless: [view_07675.id, view_07675.status]
  }

  join: view_07677 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07675.user_id} = ${view_07677.id} ;;
    required_joins: []
  }

  join: view_07678 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07675.account_id} = ${view_07678.account_id} ;;
    required_joins: [view_07677]
  }

  join: view_07679 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07675.category} = ${view_07679.category} ;;
  }

  access_filter: {
    field: view_07675.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07675.is_deleted} = false ;;
}
