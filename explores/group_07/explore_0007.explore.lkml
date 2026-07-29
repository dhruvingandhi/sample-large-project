# Explore: explore_0007
# Auto-generated LookML Explore File

include: "/views/domain_22/view_00022.view.lkml"
include: "/views/domain_24/view_00024.view.lkml"
include: "/views/domain_25/view_00025.view.lkml"
include: "/views/domain_26/view_00026.view.lkml"

explore: explore_0007 {
  label: "Explore Explore 0007"
  description: "Comprehensive analytics explore joining base view_00022 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00022
  
  always_filter: {
    filters: [view_00022.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00022.created_at_date: "7 days"]
    unless: [view_00022.id, view_00022.status]
  }

  join: view_00024 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00022.user_id} = ${view_00024.id} ;;
    required_joins: []
  }

  join: view_00025 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00022.account_id} = ${view_00025.account_id} ;;
    required_joins: [view_00024]
  }

  join: view_00026 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00022.category} = ${view_00026.category} ;;
  }

  access_filter: {
    field: view_00022.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00022.is_deleted} = false ;;
}
