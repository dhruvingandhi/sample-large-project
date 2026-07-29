# Explore: explore_2112
# Auto-generated LookML Explore File

include: "/views/domain_37/view_06337.view.lkml"
include: "/views/domain_39/view_06339.view.lkml"
include: "/views/domain_40/view_06340.view.lkml"
include: "/views/domain_41/view_06341.view.lkml"

explore: explore_2112 {
  label: "Explore Explore 2112"
  description: "Comprehensive analytics explore joining base view_06337 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06337
  
  always_filter: {
    filters: [view_06337.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06337.created_at_date: "7 days"]
    unless: [view_06337.id, view_06337.status]
  }

  join: view_06339 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06337.user_id} = ${view_06339.id} ;;
    required_joins: []
  }

  join: view_06340 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06337.account_id} = ${view_06340.account_id} ;;
    required_joins: [view_06339]
  }

  join: view_06341 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06337.category} = ${view_06341.category} ;;
  }

  access_filter: {
    field: view_06337.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06337.is_deleted} = false ;;
}
