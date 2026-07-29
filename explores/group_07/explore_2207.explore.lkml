# Explore: explore_2207
# Auto-generated LookML Explore File

include: "/views/domain_22/view_06622.view.lkml"
include: "/views/domain_24/view_06624.view.lkml"
include: "/views/domain_25/view_06625.view.lkml"
include: "/views/domain_26/view_06626.view.lkml"

explore: explore_2207 {
  label: "Explore Explore 2207"
  description: "Comprehensive analytics explore joining base view_06622 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06622
  
  always_filter: {
    filters: [view_06622.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06622.created_at_date: "7 days"]
    unless: [view_06622.id, view_06622.status]
  }

  join: view_06624 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06622.user_id} = ${view_06624.id} ;;
    required_joins: []
  }

  join: view_06625 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06622.account_id} = ${view_06625.account_id} ;;
    required_joins: [view_06624]
  }

  join: view_06626 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06622.category} = ${view_06626.category} ;;
  }

  access_filter: {
    field: view_06622.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06622.is_deleted} = false ;;
}
