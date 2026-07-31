# Update for 2000 file diff target
# Explore: explore_3950
# Auto-generated LookML Explore File

include: "/views/domain_01/view_11851.view.lkml"
include: "/views/domain_03/view_11853.view.lkml"
include: "/views/domain_04/view_11854.view.lkml"
include: "/views/domain_05/view_11855.view.lkml"

explore: explore_3950 {
  label: "Explore Explore 3950"
  description: "Comprehensive analytics explore joining base view_11851 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11851
  
  always_filter: {
    filters: [view_11851.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11851.created_at_date: "7 days"]
    unless: [view_11851.id, view_11851.status]
  }

  join: view_11853 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11851.user_id} = ${view_11853.id} ;;
    required_joins: []
  }

  join: view_11854 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11851.account_id} = ${view_11854.account_id} ;;
    required_joins: [view_11853]
  }

  join: view_11855 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11851.category} = ${view_11855.category} ;;
  }

  access_filter: {
    field: view_11851.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11851.is_deleted} = false ;;
}
