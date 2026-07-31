# Update for 2000 file diff target
# Explore: explore_2351
# Auto-generated LookML Explore File

include: "/views/domain_04/view_07054.view.lkml"
include: "/views/domain_06/view_07056.view.lkml"
include: "/views/domain_07/view_07057.view.lkml"
include: "/views/domain_08/view_07058.view.lkml"

explore: explore_2351 {
  label: "Explore Explore 2351"
  description: "Comprehensive analytics explore joining base view_07054 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07054
  
  always_filter: {
    filters: [view_07054.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07054.created_at_date: "7 days"]
    unless: [view_07054.id, view_07054.status]
  }

  join: view_07056 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07054.user_id} = ${view_07056.id} ;;
    required_joins: []
  }

  join: view_07057 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07054.account_id} = ${view_07057.account_id} ;;
    required_joins: [view_07056]
  }

  join: view_07058 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07054.category} = ${view_07058.category} ;;
  }

  access_filter: {
    field: view_07054.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07054.is_deleted} = false ;;
}
