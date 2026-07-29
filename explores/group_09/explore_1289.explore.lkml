# Explore: explore_1289
# Auto-generated LookML Explore File

include: "/views/domain_18/view_03868.view.lkml"
include: "/views/domain_20/view_03870.view.lkml"
include: "/views/domain_21/view_03871.view.lkml"
include: "/views/domain_22/view_03872.view.lkml"

explore: explore_1289 {
  label: "Explore Explore 1289"
  description: "Comprehensive analytics explore joining base view_03868 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03868
  
  always_filter: {
    filters: [view_03868.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03868.created_at_date: "7 days"]
    unless: [view_03868.id, view_03868.status]
  }

  join: view_03870 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03868.user_id} = ${view_03870.id} ;;
    required_joins: []
  }

  join: view_03871 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03868.account_id} = ${view_03871.account_id} ;;
    required_joins: [view_03870]
  }

  join: view_03872 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03868.category} = ${view_03872.category} ;;
  }

  access_filter: {
    field: view_03868.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03868.is_deleted} = false ;;
}
