# Explore: explore_0146
# Auto-generated LookML Explore File

include: "/views/domain_39/view_00439.view.lkml"
include: "/views/domain_41/view_00441.view.lkml"
include: "/views/domain_42/view_00442.view.lkml"
include: "/views/domain_43/view_00443.view.lkml"

explore: explore_0146 {
  label: "Explore Explore 0146"
  description: "Comprehensive analytics explore joining base view_00439 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00439
  
  always_filter: {
    filters: [view_00439.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00439.created_at_date: "7 days"]
    unless: [view_00439.id, view_00439.status]
  }

  join: view_00441 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00439.user_id} = ${view_00441.id} ;;
    required_joins: []
  }

  join: view_00442 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00439.account_id} = ${view_00442.account_id} ;;
    required_joins: [view_00441]
  }

  join: view_00443 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00439.category} = ${view_00443.category} ;;
  }

  access_filter: {
    field: view_00439.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00439.is_deleted} = false ;;
}
