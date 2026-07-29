# Explore: explore_3743
# Auto-generated LookML Explore File

include: "/views/domain_30/view_11230.view.lkml"
include: "/views/domain_32/view_11232.view.lkml"
include: "/views/domain_33/view_11233.view.lkml"
include: "/views/domain_34/view_11234.view.lkml"

explore: explore_3743 {
  label: "Explore Explore 3743"
  description: "Comprehensive analytics explore joining base view_11230 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11230
  
  always_filter: {
    filters: [view_11230.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11230.created_at_date: "7 days"]
    unless: [view_11230.id, view_11230.status]
  }

  join: view_11232 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11230.user_id} = ${view_11232.id} ;;
    required_joins: []
  }

  join: view_11233 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11230.account_id} = ${view_11233.account_id} ;;
    required_joins: [view_11232]
  }

  join: view_11234 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11230.category} = ${view_11234.category} ;;
  }

  access_filter: {
    field: view_11230.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11230.is_deleted} = false ;;
}
