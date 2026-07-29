# Explore: explore_0021
# Auto-generated LookML Explore File

include: "/views/domain_14/view_00064.view.lkml"
include: "/views/domain_16/view_00066.view.lkml"
include: "/views/domain_17/view_00067.view.lkml"
include: "/views/domain_18/view_00068.view.lkml"

explore: explore_0021 {
  label: "Explore Explore 0021"
  description: "Comprehensive analytics explore joining base view_00064 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00064
  
  always_filter: {
    filters: [view_00064.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00064.created_at_date: "7 days"]
    unless: [view_00064.id, view_00064.status]
  }

  join: view_00066 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00064.user_id} = ${view_00066.id} ;;
    required_joins: []
  }

  join: view_00067 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00064.account_id} = ${view_00067.account_id} ;;
    required_joins: [view_00066]
  }

  join: view_00068 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00064.category} = ${view_00068.category} ;;
  }

  access_filter: {
    field: view_00064.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00064.is_deleted} = false ;;
}
