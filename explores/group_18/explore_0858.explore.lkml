# Explore: explore_0858
# Auto-generated LookML Explore File

include: "/views/domain_25/view_02575.view.lkml"
include: "/views/domain_27/view_02577.view.lkml"
include: "/views/domain_28/view_02578.view.lkml"
include: "/views/domain_29/view_02579.view.lkml"

explore: explore_0858 {
  label: "Explore Explore 0858"
  description: "Comprehensive analytics explore joining base view_02575 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02575
  
  always_filter: {
    filters: [view_02575.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02575.created_at_date: "7 days"]
    unless: [view_02575.id, view_02575.status]
  }

  join: view_02577 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02575.user_id} = ${view_02577.id} ;;
    required_joins: []
  }

  join: view_02578 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02575.account_id} = ${view_02578.account_id} ;;
    required_joins: [view_02577]
  }

  join: view_02579 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02575.category} = ${view_02579.category} ;;
  }

  access_filter: {
    field: view_02575.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02575.is_deleted} = false ;;
}
