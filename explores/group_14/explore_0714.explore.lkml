# Explore: explore_0714
# Auto-generated LookML Explore File

include: "/views/domain_43/view_02143.view.lkml"
include: "/views/domain_45/view_02145.view.lkml"
include: "/views/domain_46/view_02146.view.lkml"
include: "/views/domain_47/view_02147.view.lkml"

explore: explore_0714 {
  label: "Explore Explore 0714"
  description: "Comprehensive analytics explore joining base view_02143 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02143
  
  always_filter: {
    filters: [view_02143.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02143.created_at_date: "7 days"]
    unless: [view_02143.id, view_02143.status]
  }

  join: view_02145 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02143.user_id} = ${view_02145.id} ;;
    required_joins: []
  }

  join: view_02146 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02143.account_id} = ${view_02146.account_id} ;;
    required_joins: [view_02145]
  }

  join: view_02147 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02143.category} = ${view_02147.category} ;;
  }

  access_filter: {
    field: view_02143.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02143.is_deleted} = false ;;
}
