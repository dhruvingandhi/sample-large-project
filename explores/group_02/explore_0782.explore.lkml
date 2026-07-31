# Update for 500 file diff target
# Explore: explore_0782
# Auto-generated LookML Explore File

include: "/views/domain_47/view_02347.view.lkml"
include: "/views/domain_49/view_02349.view.lkml"
include: "/views/domain_50/view_02350.view.lkml"
include: "/views/domain_01/view_02351.view.lkml"

explore: explore_0782 {
  label: "Explore Explore 0782"
  description: "Comprehensive analytics explore joining base view_02347 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02347
  
  always_filter: {
    filters: [view_02347.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02347.created_at_date: "7 days"]
    unless: [view_02347.id, view_02347.status]
  }

  join: view_02349 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02347.user_id} = ${view_02349.id} ;;
    required_joins: []
  }

  join: view_02350 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02347.account_id} = ${view_02350.account_id} ;;
    required_joins: [view_02349]
  }

  join: view_02351 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02347.category} = ${view_02351.category} ;;
  }

  access_filter: {
    field: view_02347.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02347.is_deleted} = false ;;
}
