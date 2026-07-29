# Explore: explore_3724
# Auto-generated LookML Explore File

include: "/views/domain_23/view_11173.view.lkml"
include: "/views/domain_25/view_11175.view.lkml"
include: "/views/domain_26/view_11176.view.lkml"
include: "/views/domain_27/view_11177.view.lkml"

explore: explore_3724 {
  label: "Explore Explore 3724"
  description: "Comprehensive analytics explore joining base view_11173 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11173
  
  always_filter: {
    filters: [view_11173.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11173.created_at_date: "7 days"]
    unless: [view_11173.id, view_11173.status]
  }

  join: view_11175 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11173.user_id} = ${view_11175.id} ;;
    required_joins: []
  }

  join: view_11176 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11173.account_id} = ${view_11176.account_id} ;;
    required_joins: [view_11175]
  }

  join: view_11177 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11173.category} = ${view_11177.category} ;;
  }

  access_filter: {
    field: view_11173.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11173.is_deleted} = false ;;
}
