# Explore: explore_1812
# Auto-generated LookML Explore File

include: "/views/domain_37/view_05437.view.lkml"
include: "/views/domain_39/view_05439.view.lkml"
include: "/views/domain_40/view_05440.view.lkml"
include: "/views/domain_41/view_05441.view.lkml"

explore: explore_1812 {
  label: "Explore Explore 1812"
  description: "Comprehensive analytics explore joining base view_05437 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05437
  
  always_filter: {
    filters: [view_05437.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05437.created_at_date: "7 days"]
    unless: [view_05437.id, view_05437.status]
  }

  join: view_05439 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05437.user_id} = ${view_05439.id} ;;
    required_joins: []
  }

  join: view_05440 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05437.account_id} = ${view_05440.account_id} ;;
    required_joins: [view_05439]
  }

  join: view_05441 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05437.category} = ${view_05441.category} ;;
  }

  access_filter: {
    field: view_05437.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05437.is_deleted} = false ;;
}
