# Explore: explore_2232
# Auto-generated LookML Explore File

include: "/views/domain_47/view_06697.view.lkml"
include: "/views/domain_49/view_06699.view.lkml"
include: "/views/domain_50/view_06700.view.lkml"
include: "/views/domain_01/view_06701.view.lkml"

explore: explore_2232 {
  label: "Explore Explore 2232"
  description: "Comprehensive analytics explore joining base view_06697 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06697
  
  always_filter: {
    filters: [view_06697.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06697.created_at_date: "7 days"]
    unless: [view_06697.id, view_06697.status]
  }

  join: view_06699 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06697.user_id} = ${view_06699.id} ;;
    required_joins: []
  }

  join: view_06700 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06697.account_id} = ${view_06700.account_id} ;;
    required_joins: [view_06699]
  }

  join: view_06701 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06697.category} = ${view_06701.category} ;;
  }

  access_filter: {
    field: view_06697.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06697.is_deleted} = false ;;
}
