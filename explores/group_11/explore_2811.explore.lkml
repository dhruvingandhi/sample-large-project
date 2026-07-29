# Explore: explore_2811
# Auto-generated LookML Explore File

include: "/views/domain_34/view_08434.view.lkml"
include: "/views/domain_36/view_08436.view.lkml"
include: "/views/domain_37/view_08437.view.lkml"
include: "/views/domain_38/view_08438.view.lkml"

explore: explore_2811 {
  label: "Explore Explore 2811"
  description: "Comprehensive analytics explore joining base view_08434 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08434
  
  always_filter: {
    filters: [view_08434.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08434.created_at_date: "7 days"]
    unless: [view_08434.id, view_08434.status]
  }

  join: view_08436 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08434.user_id} = ${view_08436.id} ;;
    required_joins: []
  }

  join: view_08437 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08434.account_id} = ${view_08437.account_id} ;;
    required_joins: [view_08436]
  }

  join: view_08438 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08434.category} = ${view_08438.category} ;;
  }

  access_filter: {
    field: view_08434.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08434.is_deleted} = false ;;
}
