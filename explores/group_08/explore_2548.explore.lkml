# Explore: explore_2548
# Auto-generated LookML Explore File

include: "/views/domain_45/view_07645.view.lkml"
include: "/views/domain_47/view_07647.view.lkml"
include: "/views/domain_48/view_07648.view.lkml"
include: "/views/domain_49/view_07649.view.lkml"

explore: explore_2548 {
  label: "Explore Explore 2548"
  description: "Comprehensive analytics explore joining base view_07645 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07645
  
  always_filter: {
    filters: [view_07645.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07645.created_at_date: "7 days"]
    unless: [view_07645.id, view_07645.status]
  }

  join: view_07647 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07645.user_id} = ${view_07647.id} ;;
    required_joins: []
  }

  join: view_07648 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07645.account_id} = ${view_07648.account_id} ;;
    required_joins: [view_07647]
  }

  join: view_07649 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07645.category} = ${view_07649.category} ;;
  }

  access_filter: {
    field: view_07645.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07645.is_deleted} = false ;;
}
