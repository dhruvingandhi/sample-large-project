# Explore: explore_2225
# Auto-generated LookML Explore File

include: "/views/domain_26/view_06676.view.lkml"
include: "/views/domain_28/view_06678.view.lkml"
include: "/views/domain_29/view_06679.view.lkml"
include: "/views/domain_30/view_06680.view.lkml"

explore: explore_2225 {
  label: "Explore Explore 2225"
  description: "Comprehensive analytics explore joining base view_06676 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06676
  
  always_filter: {
    filters: [view_06676.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06676.created_at_date: "7 days"]
    unless: [view_06676.id, view_06676.status]
  }

  join: view_06678 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06676.user_id} = ${view_06678.id} ;;
    required_joins: []
  }

  join: view_06679 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06676.account_id} = ${view_06679.account_id} ;;
    required_joins: [view_06678]
  }

  join: view_06680 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06676.category} = ${view_06680.category} ;;
  }

  access_filter: {
    field: view_06676.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06676.is_deleted} = false ;;
}
