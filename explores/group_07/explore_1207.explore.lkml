# Explore: explore_1207
# Auto-generated LookML Explore File

include: "/views/domain_22/view_03622.view.lkml"
include: "/views/domain_24/view_03624.view.lkml"
include: "/views/domain_25/view_03625.view.lkml"
include: "/views/domain_26/view_03626.view.lkml"

explore: explore_1207 {
  label: "Explore Explore 1207"
  description: "Comprehensive analytics explore joining base view_03622 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03622
  
  always_filter: {
    filters: [view_03622.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03622.created_at_date: "7 days"]
    unless: [view_03622.id, view_03622.status]
  }

  join: view_03624 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03622.user_id} = ${view_03624.id} ;;
    required_joins: []
  }

  join: view_03625 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03622.account_id} = ${view_03625.account_id} ;;
    required_joins: [view_03624]
  }

  join: view_03626 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03622.category} = ${view_03626.category} ;;
  }

  access_filter: {
    field: view_03622.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03622.is_deleted} = false ;;
}
