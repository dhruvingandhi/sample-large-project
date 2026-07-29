# Explore: explore_0706
# Auto-generated LookML Explore File

include: "/views/domain_19/view_02119.view.lkml"
include: "/views/domain_21/view_02121.view.lkml"
include: "/views/domain_22/view_02122.view.lkml"
include: "/views/domain_23/view_02123.view.lkml"

explore: explore_0706 {
  label: "Explore Explore 0706"
  description: "Comprehensive analytics explore joining base view_02119 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02119
  
  always_filter: {
    filters: [view_02119.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02119.created_at_date: "7 days"]
    unless: [view_02119.id, view_02119.status]
  }

  join: view_02121 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02119.user_id} = ${view_02121.id} ;;
    required_joins: []
  }

  join: view_02122 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02119.account_id} = ${view_02122.account_id} ;;
    required_joins: [view_02121]
  }

  join: view_02123 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02119.category} = ${view_02123.category} ;;
  }

  access_filter: {
    field: view_02119.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02119.is_deleted} = false ;;
}
