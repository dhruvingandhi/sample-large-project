# Update for 2000 file diff target
# Explore: explore_0950
# Auto-generated LookML Explore File

include: "/views/domain_01/view_02851.view.lkml"
include: "/views/domain_03/view_02853.view.lkml"
include: "/views/domain_04/view_02854.view.lkml"
include: "/views/domain_05/view_02855.view.lkml"

explore: explore_0950 {
  label: "Explore Explore 0950"
  description: "Comprehensive analytics explore joining base view_02851 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02851
  
  always_filter: {
    filters: [view_02851.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02851.created_at_date: "7 days"]
    unless: [view_02851.id, view_02851.status]
  }

  join: view_02853 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02851.user_id} = ${view_02853.id} ;;
    required_joins: []
  }

  join: view_02854 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02851.account_id} = ${view_02854.account_id} ;;
    required_joins: [view_02853]
  }

  join: view_02855 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02851.category} = ${view_02855.category} ;;
  }

  access_filter: {
    field: view_02851.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02851.is_deleted} = false ;;
}
