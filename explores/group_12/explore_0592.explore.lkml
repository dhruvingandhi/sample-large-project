# Explore: explore_0592
# Auto-generated LookML Explore File

include: "/views/domain_27/view_01777.view.lkml"
include: "/views/domain_29/view_01779.view.lkml"
include: "/views/domain_30/view_01780.view.lkml"
include: "/views/domain_31/view_01781.view.lkml"

explore: explore_0592 {
  label: "Explore Explore 0592"
  description: "Comprehensive analytics explore joining base view_01777 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01777
  
  always_filter: {
    filters: [view_01777.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01777.created_at_date: "7 days"]
    unless: [view_01777.id, view_01777.status]
  }

  join: view_01779 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01777.user_id} = ${view_01779.id} ;;
    required_joins: []
  }

  join: view_01780 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01777.account_id} = ${view_01780.account_id} ;;
    required_joins: [view_01779]
  }

  join: view_01781 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01777.category} = ${view_01781.category} ;;
  }

  access_filter: {
    field: view_01777.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01777.is_deleted} = false ;;
}
