# Explore: explore_1256
# Auto-generated LookML Explore File

include: "/views/domain_19/view_03769.view.lkml"
include: "/views/domain_21/view_03771.view.lkml"
include: "/views/domain_22/view_03772.view.lkml"
include: "/views/domain_23/view_03773.view.lkml"

explore: explore_1256 {
  label: "Explore Explore 1256"
  description: "Comprehensive analytics explore joining base view_03769 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03769
  
  always_filter: {
    filters: [view_03769.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03769.created_at_date: "7 days"]
    unless: [view_03769.id, view_03769.status]
  }

  join: view_03771 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03769.user_id} = ${view_03771.id} ;;
    required_joins: []
  }

  join: view_03772 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03769.account_id} = ${view_03772.account_id} ;;
    required_joins: [view_03771]
  }

  join: view_03773 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03769.category} = ${view_03773.category} ;;
  }

  access_filter: {
    field: view_03769.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03769.is_deleted} = false ;;
}
