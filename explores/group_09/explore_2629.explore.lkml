# Explore: explore_2629
# Auto-generated LookML Explore File

include: "/views/domain_38/view_07888.view.lkml"
include: "/views/domain_40/view_07890.view.lkml"
include: "/views/domain_41/view_07891.view.lkml"
include: "/views/domain_42/view_07892.view.lkml"

explore: explore_2629 {
  label: "Explore Explore 2629"
  description: "Comprehensive analytics explore joining base view_07888 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07888
  
  always_filter: {
    filters: [view_07888.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07888.created_at_date: "7 days"]
    unless: [view_07888.id, view_07888.status]
  }

  join: view_07890 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07888.user_id} = ${view_07890.id} ;;
    required_joins: []
  }

  join: view_07891 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07888.account_id} = ${view_07891.account_id} ;;
    required_joins: [view_07890]
  }

  join: view_07892 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07888.category} = ${view_07892.category} ;;
  }

  access_filter: {
    field: view_07888.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07888.is_deleted} = false ;;
}
