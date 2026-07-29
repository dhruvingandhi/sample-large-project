# Explore: explore_1294
# Auto-generated LookML Explore File

include: "/views/domain_33/view_03883.view.lkml"
include: "/views/domain_35/view_03885.view.lkml"
include: "/views/domain_36/view_03886.view.lkml"
include: "/views/domain_37/view_03887.view.lkml"

explore: explore_1294 {
  label: "Explore Explore 1294"
  description: "Comprehensive analytics explore joining base view_03883 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03883
  
  always_filter: {
    filters: [view_03883.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03883.created_at_date: "7 days"]
    unless: [view_03883.id, view_03883.status]
  }

  join: view_03885 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03883.user_id} = ${view_03885.id} ;;
    required_joins: []
  }

  join: view_03886 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03883.account_id} = ${view_03886.account_id} ;;
    required_joins: [view_03885]
  }

  join: view_03887 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03883.category} = ${view_03887.category} ;;
  }

  access_filter: {
    field: view_03883.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03883.is_deleted} = false ;;
}
