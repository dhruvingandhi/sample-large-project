# Update for 2000 file diff target
# Explore: explore_1378
# Auto-generated LookML Explore File

include: "/views/domain_35/view_04135.view.lkml"
include: "/views/domain_37/view_04137.view.lkml"
include: "/views/domain_38/view_04138.view.lkml"
include: "/views/domain_39/view_04139.view.lkml"

explore: explore_1378 {
  label: "Explore Explore 1378"
  description: "Comprehensive analytics explore joining base view_04135 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04135
  
  always_filter: {
    filters: [view_04135.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04135.created_at_date: "7 days"]
    unless: [view_04135.id, view_04135.status]
  }

  join: view_04137 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04135.user_id} = ${view_04137.id} ;;
    required_joins: []
  }

  join: view_04138 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04135.account_id} = ${view_04138.account_id} ;;
    required_joins: [view_04137]
  }

  join: view_04139 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04135.category} = ${view_04139.category} ;;
  }

  access_filter: {
    field: view_04135.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04135.is_deleted} = false ;;
}
