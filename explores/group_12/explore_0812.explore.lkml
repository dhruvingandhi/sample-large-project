# Explore: explore_0812
# Auto-generated LookML Explore File

include: "/views/domain_37/view_02437.view.lkml"
include: "/views/domain_39/view_02439.view.lkml"
include: "/views/domain_40/view_02440.view.lkml"
include: "/views/domain_41/view_02441.view.lkml"

explore: explore_0812 {
  label: "Explore Explore 0812"
  description: "Comprehensive analytics explore joining base view_02437 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02437
  
  always_filter: {
    filters: [view_02437.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02437.created_at_date: "7 days"]
    unless: [view_02437.id, view_02437.status]
  }

  join: view_02439 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02437.user_id} = ${view_02439.id} ;;
    required_joins: []
  }

  join: view_02440 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02437.account_id} = ${view_02440.account_id} ;;
    required_joins: [view_02439]
  }

  join: view_02441 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02437.category} = ${view_02441.category} ;;
  }

  access_filter: {
    field: view_02437.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02437.is_deleted} = false ;;
}
