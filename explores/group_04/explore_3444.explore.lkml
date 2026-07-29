# Explore: explore_3444
# Auto-generated LookML Explore File

include: "/views/domain_33/view_10333.view.lkml"
include: "/views/domain_35/view_10335.view.lkml"
include: "/views/domain_36/view_10336.view.lkml"
include: "/views/domain_37/view_10337.view.lkml"

explore: explore_3444 {
  label: "Explore Explore 3444"
  description: "Comprehensive analytics explore joining base view_10333 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10333
  
  always_filter: {
    filters: [view_10333.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10333.created_at_date: "7 days"]
    unless: [view_10333.id, view_10333.status]
  }

  join: view_10335 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10333.user_id} = ${view_10335.id} ;;
    required_joins: []
  }

  join: view_10336 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10333.account_id} = ${view_10336.account_id} ;;
    required_joins: [view_10335]
  }

  join: view_10337 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10333.category} = ${view_10337.category} ;;
  }

  access_filter: {
    field: view_10333.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10333.is_deleted} = false ;;
}
