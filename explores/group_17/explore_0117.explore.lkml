# Explore: explore_0117
# Auto-generated LookML Explore File

include: "/views/domain_02/view_00352.view.lkml"
include: "/views/domain_04/view_00354.view.lkml"
include: "/views/domain_05/view_00355.view.lkml"
include: "/views/domain_06/view_00356.view.lkml"

explore: explore_0117 {
  label: "Explore Explore 0117"
  description: "Comprehensive analytics explore joining base view_00352 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00352
  
  always_filter: {
    filters: [view_00352.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00352.created_at_date: "7 days"]
    unless: [view_00352.id, view_00352.status]
  }

  join: view_00354 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00352.user_id} = ${view_00354.id} ;;
    required_joins: []
  }

  join: view_00355 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00352.account_id} = ${view_00355.account_id} ;;
    required_joins: [view_00354]
  }

  join: view_00356 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00352.category} = ${view_00356.category} ;;
  }

  access_filter: {
    field: view_00352.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00352.is_deleted} = false ;;
}
