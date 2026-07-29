# Explore: explore_1146
# Auto-generated LookML Explore File

include: "/views/domain_39/view_03439.view.lkml"
include: "/views/domain_41/view_03441.view.lkml"
include: "/views/domain_42/view_03442.view.lkml"
include: "/views/domain_43/view_03443.view.lkml"

explore: explore_1146 {
  label: "Explore Explore 1146"
  description: "Comprehensive analytics explore joining base view_03439 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03439
  
  always_filter: {
    filters: [view_03439.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03439.created_at_date: "7 days"]
    unless: [view_03439.id, view_03439.status]
  }

  join: view_03441 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03439.user_id} = ${view_03441.id} ;;
    required_joins: []
  }

  join: view_03442 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03439.account_id} = ${view_03442.account_id} ;;
    required_joins: [view_03441]
  }

  join: view_03443 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03439.category} = ${view_03443.category} ;;
  }

  access_filter: {
    field: view_03439.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03439.is_deleted} = false ;;
}
