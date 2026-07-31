# Update for 2000 file diff target
# Explore: explore_2390
# Auto-generated LookML Explore File

include: "/views/domain_21/view_07171.view.lkml"
include: "/views/domain_23/view_07173.view.lkml"
include: "/views/domain_24/view_07174.view.lkml"
include: "/views/domain_25/view_07175.view.lkml"

explore: explore_2390 {
  label: "Explore Explore 2390"
  description: "Comprehensive analytics explore joining base view_07171 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07171
  
  always_filter: {
    filters: [view_07171.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07171.created_at_date: "7 days"]
    unless: [view_07171.id, view_07171.status]
  }

  join: view_07173 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07171.user_id} = ${view_07173.id} ;;
    required_joins: []
  }

  join: view_07174 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07171.account_id} = ${view_07174.account_id} ;;
    required_joins: [view_07173]
  }

  join: view_07175 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07171.category} = ${view_07175.category} ;;
  }

  access_filter: {
    field: view_07171.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07171.is_deleted} = false ;;
}
