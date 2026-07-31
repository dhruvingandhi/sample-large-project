# Update for 2000 file diff target
# Explore: explore_2019
# Auto-generated LookML Explore File

include: "/views/domain_08/view_06058.view.lkml"
include: "/views/domain_10/view_06060.view.lkml"
include: "/views/domain_11/view_06061.view.lkml"
include: "/views/domain_12/view_06062.view.lkml"

explore: explore_2019 {
  label: "Explore Explore 2019"
  description: "Comprehensive analytics explore joining base view_06058 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06058
  
  always_filter: {
    filters: [view_06058.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06058.created_at_date: "7 days"]
    unless: [view_06058.id, view_06058.status]
  }

  join: view_06060 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06058.user_id} = ${view_06060.id} ;;
    required_joins: []
  }

  join: view_06061 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06058.account_id} = ${view_06061.account_id} ;;
    required_joins: [view_06060]
  }

  join: view_06062 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06058.category} = ${view_06062.category} ;;
  }

  access_filter: {
    field: view_06058.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06058.is_deleted} = false ;;
}
