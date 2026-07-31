# Update for 2000 file diff target
# Explore: explore_1710
# Auto-generated LookML Explore File

include: "/views/domain_31/view_05131.view.lkml"
include: "/views/domain_33/view_05133.view.lkml"
include: "/views/domain_34/view_05134.view.lkml"
include: "/views/domain_35/view_05135.view.lkml"

explore: explore_1710 {
  label: "Explore Explore 1710"
  description: "Comprehensive analytics explore joining base view_05131 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05131
  
  always_filter: {
    filters: [view_05131.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05131.created_at_date: "7 days"]
    unless: [view_05131.id, view_05131.status]
  }

  join: view_05133 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05131.user_id} = ${view_05133.id} ;;
    required_joins: []
  }

  join: view_05134 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05131.account_id} = ${view_05134.account_id} ;;
    required_joins: [view_05133]
  }

  join: view_05135 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05131.category} = ${view_05135.category} ;;
  }

  access_filter: {
    field: view_05131.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05131.is_deleted} = false ;;
}
