# Explore: explore_1099
# Auto-generated LookML Explore File

include: "/views/domain_48/view_03298.view.lkml"
include: "/views/domain_50/view_03300.view.lkml"
include: "/views/domain_01/view_03301.view.lkml"
include: "/views/domain_02/view_03302.view.lkml"

explore: explore_1099 {
  label: "Explore Explore 1099"
  description: "Comprehensive analytics explore joining base view_03298 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03298
  
  always_filter: {
    filters: [view_03298.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03298.created_at_date: "7 days"]
    unless: [view_03298.id, view_03298.status]
  }

  join: view_03300 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03298.user_id} = ${view_03300.id} ;;
    required_joins: []
  }

  join: view_03301 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03298.account_id} = ${view_03301.account_id} ;;
    required_joins: [view_03300]
  }

  join: view_03302 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03298.category} = ${view_03302.category} ;;
  }

  access_filter: {
    field: view_03298.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03298.is_deleted} = false ;;
}
