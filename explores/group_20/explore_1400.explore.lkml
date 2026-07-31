# Update for 2000 file diff target
# Explore: explore_1400
# Auto-generated LookML Explore File

include: "/views/domain_01/view_04201.view.lkml"
include: "/views/domain_03/view_04203.view.lkml"
include: "/views/domain_04/view_04204.view.lkml"
include: "/views/domain_05/view_04205.view.lkml"

explore: explore_1400 {
  label: "Explore Explore 1400"
  description: "Comprehensive analytics explore joining base view_04201 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04201
  
  always_filter: {
    filters: [view_04201.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04201.created_at_date: "7 days"]
    unless: [view_04201.id, view_04201.status]
  }

  join: view_04203 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04201.user_id} = ${view_04203.id} ;;
    required_joins: []
  }

  join: view_04204 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04201.account_id} = ${view_04204.account_id} ;;
    required_joins: [view_04203]
  }

  join: view_04205 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04201.category} = ${view_04205.category} ;;
  }

  access_filter: {
    field: view_04201.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04201.is_deleted} = false ;;
}
