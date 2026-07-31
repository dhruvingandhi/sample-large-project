# Update for 2000 file diff target
# Explore: explore_1359
# Auto-generated LookML Explore File

include: "/views/domain_28/view_04078.view.lkml"
include: "/views/domain_30/view_04080.view.lkml"
include: "/views/domain_31/view_04081.view.lkml"
include: "/views/domain_32/view_04082.view.lkml"

explore: explore_1359 {
  label: "Explore Explore 1359"
  description: "Comprehensive analytics explore joining base view_04078 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04078
  
  always_filter: {
    filters: [view_04078.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04078.created_at_date: "7 days"]
    unless: [view_04078.id, view_04078.status]
  }

  join: view_04080 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04078.user_id} = ${view_04080.id} ;;
    required_joins: []
  }

  join: view_04081 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04078.account_id} = ${view_04081.account_id} ;;
    required_joins: [view_04080]
  }

  join: view_04082 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04078.category} = ${view_04082.category} ;;
  }

  access_filter: {
    field: view_04078.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04078.is_deleted} = false ;;
}
