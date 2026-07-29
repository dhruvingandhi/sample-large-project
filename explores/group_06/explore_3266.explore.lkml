# Explore: explore_3266
# Auto-generated LookML Explore File

include: "/views/domain_49/view_09799.view.lkml"
include: "/views/domain_01/view_09801.view.lkml"
include: "/views/domain_02/view_09802.view.lkml"
include: "/views/domain_03/view_09803.view.lkml"

explore: explore_3266 {
  label: "Explore Explore 3266"
  description: "Comprehensive analytics explore joining base view_09799 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09799
  
  always_filter: {
    filters: [view_09799.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09799.created_at_date: "7 days"]
    unless: [view_09799.id, view_09799.status]
  }

  join: view_09801 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09799.user_id} = ${view_09801.id} ;;
    required_joins: []
  }

  join: view_09802 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09799.account_id} = ${view_09802.account_id} ;;
    required_joins: [view_09801]
  }

  join: view_09803 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09799.category} = ${view_09803.category} ;;
  }

  access_filter: {
    field: view_09799.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09799.is_deleted} = false ;;
}
