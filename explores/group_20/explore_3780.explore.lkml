# Explore: explore_3780
# Auto-generated LookML Explore File

include: "/views/domain_41/view_11341.view.lkml"
include: "/views/domain_43/view_11343.view.lkml"
include: "/views/domain_44/view_11344.view.lkml"
include: "/views/domain_45/view_11345.view.lkml"

explore: explore_3780 {
  label: "Explore Explore 3780"
  description: "Comprehensive analytics explore joining base view_11341 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11341
  
  always_filter: {
    filters: [view_11341.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11341.created_at_date: "7 days"]
    unless: [view_11341.id, view_11341.status]
  }

  join: view_11343 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11341.user_id} = ${view_11343.id} ;;
    required_joins: []
  }

  join: view_11344 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11341.account_id} = ${view_11344.account_id} ;;
    required_joins: [view_11343]
  }

  join: view_11345 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11341.category} = ${view_11345.category} ;;
  }

  access_filter: {
    field: view_11341.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11341.is_deleted} = false ;;
}
