# Explore: explore_1195
# Auto-generated LookML Explore File

include: "/views/domain_36/view_03586.view.lkml"
include: "/views/domain_38/view_03588.view.lkml"
include: "/views/domain_39/view_03589.view.lkml"
include: "/views/domain_40/view_03590.view.lkml"

explore: explore_1195 {
  label: "Explore Explore 1195"
  description: "Comprehensive analytics explore joining base view_03586 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03586
  
  always_filter: {
    filters: [view_03586.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03586.created_at_date: "7 days"]
    unless: [view_03586.id, view_03586.status]
  }

  join: view_03588 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03586.user_id} = ${view_03588.id} ;;
    required_joins: []
  }

  join: view_03589 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03586.account_id} = ${view_03589.account_id} ;;
    required_joins: [view_03588]
  }

  join: view_03590 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03586.category} = ${view_03590.category} ;;
  }

  access_filter: {
    field: view_03586.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03586.is_deleted} = false ;;
}
