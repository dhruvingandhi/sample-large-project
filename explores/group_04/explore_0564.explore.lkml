# Explore: explore_0564
# Auto-generated LookML Explore File

include: "/views/domain_43/view_01693.view.lkml"
include: "/views/domain_45/view_01695.view.lkml"
include: "/views/domain_46/view_01696.view.lkml"
include: "/views/domain_47/view_01697.view.lkml"

explore: explore_0564 {
  label: "Explore Explore 0564"
  description: "Comprehensive analytics explore joining base view_01693 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01693
  
  always_filter: {
    filters: [view_01693.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01693.created_at_date: "7 days"]
    unless: [view_01693.id, view_01693.status]
  }

  join: view_01695 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01693.user_id} = ${view_01695.id} ;;
    required_joins: []
  }

  join: view_01696 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01693.account_id} = ${view_01696.account_id} ;;
    required_joins: [view_01695]
  }

  join: view_01697 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01693.category} = ${view_01697.category} ;;
  }

  access_filter: {
    field: view_01693.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01693.is_deleted} = false ;;
}
