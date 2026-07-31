# Update for 2000 file diff target
# Explore: explore_1700
# Auto-generated LookML Explore File

include: "/views/domain_01/view_05101.view.lkml"
include: "/views/domain_03/view_05103.view.lkml"
include: "/views/domain_04/view_05104.view.lkml"
include: "/views/domain_05/view_05105.view.lkml"

explore: explore_1700 {
  label: "Explore Explore 1700"
  description: "Comprehensive analytics explore joining base view_05101 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05101
  
  always_filter: {
    filters: [view_05101.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05101.created_at_date: "7 days"]
    unless: [view_05101.id, view_05101.status]
  }

  join: view_05103 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05101.user_id} = ${view_05103.id} ;;
    required_joins: []
  }

  join: view_05104 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05101.account_id} = ${view_05104.account_id} ;;
    required_joins: [view_05103]
  }

  join: view_05105 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05101.category} = ${view_05105.category} ;;
  }

  access_filter: {
    field: view_05101.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05101.is_deleted} = false ;;
}
