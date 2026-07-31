# Update for 2000 file diff target
# Explore: explore_3340
# Auto-generated LookML Explore File

include: "/views/domain_21/view_10021.view.lkml"
include: "/views/domain_23/view_10023.view.lkml"
include: "/views/domain_24/view_10024.view.lkml"
include: "/views/domain_25/view_10025.view.lkml"

explore: explore_3340 {
  label: "Explore Explore 3340"
  description: "Comprehensive analytics explore joining base view_10021 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10021
  
  always_filter: {
    filters: [view_10021.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10021.created_at_date: "7 days"]
    unless: [view_10021.id, view_10021.status]
  }

  join: view_10023 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10021.user_id} = ${view_10023.id} ;;
    required_joins: []
  }

  join: view_10024 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10021.account_id} = ${view_10024.account_id} ;;
    required_joins: [view_10023]
  }

  join: view_10025 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10021.category} = ${view_10025.category} ;;
  }

  access_filter: {
    field: view_10021.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10021.is_deleted} = false ;;
}
