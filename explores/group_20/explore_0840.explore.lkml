# Update for 2000 file diff target
# Explore: explore_0840
# Auto-generated LookML Explore File

include: "/views/domain_21/view_02521.view.lkml"
include: "/views/domain_23/view_02523.view.lkml"
include: "/views/domain_24/view_02524.view.lkml"
include: "/views/domain_25/view_02525.view.lkml"

explore: explore_0840 {
  label: "Explore Explore 0840"
  description: "Comprehensive analytics explore joining base view_02521 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02521
  
  always_filter: {
    filters: [view_02521.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02521.created_at_date: "7 days"]
    unless: [view_02521.id, view_02521.status]
  }

  join: view_02523 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02521.user_id} = ${view_02523.id} ;;
    required_joins: []
  }

  join: view_02524 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02521.account_id} = ${view_02524.account_id} ;;
    required_joins: [view_02523]
  }

  join: view_02525 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02521.category} = ${view_02525.category} ;;
  }

  access_filter: {
    field: view_02521.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02521.is_deleted} = false ;;
}
