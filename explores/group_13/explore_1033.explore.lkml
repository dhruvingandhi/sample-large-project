# Explore: explore_1033
# Auto-generated LookML Explore File

include: "/views/domain_50/view_03100.view.lkml"
include: "/views/domain_02/view_03102.view.lkml"
include: "/views/domain_03/view_03103.view.lkml"
include: "/views/domain_04/view_03104.view.lkml"

explore: explore_1033 {
  label: "Explore Explore 1033"
  description: "Comprehensive analytics explore joining base view_03100 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03100
  
  always_filter: {
    filters: [view_03100.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03100.created_at_date: "7 days"]
    unless: [view_03100.id, view_03100.status]
  }

  join: view_03102 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03100.user_id} = ${view_03102.id} ;;
    required_joins: []
  }

  join: view_03103 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03100.account_id} = ${view_03103.account_id} ;;
    required_joins: [view_03102]
  }

  join: view_03104 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03100.category} = ${view_03104.category} ;;
  }

  access_filter: {
    field: view_03100.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03100.is_deleted} = false ;;
}
