# Explore: explore_0869
# Auto-generated LookML Explore File

include: "/views/domain_08/view_02608.view.lkml"
include: "/views/domain_10/view_02610.view.lkml"
include: "/views/domain_11/view_02611.view.lkml"
include: "/views/domain_12/view_02612.view.lkml"

explore: explore_0869 {
  label: "Explore Explore 0869"
  description: "Comprehensive analytics explore joining base view_02608 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02608
  
  always_filter: {
    filters: [view_02608.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02608.created_at_date: "7 days"]
    unless: [view_02608.id, view_02608.status]
  }

  join: view_02610 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02608.user_id} = ${view_02610.id} ;;
    required_joins: []
  }

  join: view_02611 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02608.account_id} = ${view_02611.account_id} ;;
    required_joins: [view_02610]
  }

  join: view_02612 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02608.category} = ${view_02612.category} ;;
  }

  access_filter: {
    field: view_02608.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02608.is_deleted} = false ;;
}
