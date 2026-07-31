# Update for 2000 file diff target
# Explore: explore_1390
# Auto-generated LookML Explore File

include: "/views/domain_21/view_04171.view.lkml"
include: "/views/domain_23/view_04173.view.lkml"
include: "/views/domain_24/view_04174.view.lkml"
include: "/views/domain_25/view_04175.view.lkml"

explore: explore_1390 {
  label: "Explore Explore 1390"
  description: "Comprehensive analytics explore joining base view_04171 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04171
  
  always_filter: {
    filters: [view_04171.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04171.created_at_date: "7 days"]
    unless: [view_04171.id, view_04171.status]
  }

  join: view_04173 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04171.user_id} = ${view_04173.id} ;;
    required_joins: []
  }

  join: view_04174 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04171.account_id} = ${view_04174.account_id} ;;
    required_joins: [view_04173]
  }

  join: view_04175 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04171.category} = ${view_04175.category} ;;
  }

  access_filter: {
    field: view_04171.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04171.is_deleted} = false ;;
}
