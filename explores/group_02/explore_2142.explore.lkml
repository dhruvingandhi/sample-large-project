# Explore: explore_2142
# Auto-generated LookML Explore File

include: "/views/domain_27/view_06427.view.lkml"
include: "/views/domain_29/view_06429.view.lkml"
include: "/views/domain_30/view_06430.view.lkml"
include: "/views/domain_31/view_06431.view.lkml"

explore: explore_2142 {
  label: "Explore Explore 2142"
  description: "Comprehensive analytics explore joining base view_06427 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06427
  
  always_filter: {
    filters: [view_06427.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06427.created_at_date: "7 days"]
    unless: [view_06427.id, view_06427.status]
  }

  join: view_06429 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06427.user_id} = ${view_06429.id} ;;
    required_joins: []
  }

  join: view_06430 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06427.account_id} = ${view_06430.account_id} ;;
    required_joins: [view_06429]
  }

  join: view_06431 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06427.category} = ${view_06431.category} ;;
  }

  access_filter: {
    field: view_06427.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06427.is_deleted} = false ;;
}
