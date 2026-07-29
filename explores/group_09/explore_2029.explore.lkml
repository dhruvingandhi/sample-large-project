# Explore: explore_2029
# Auto-generated LookML Explore File

include: "/views/domain_38/view_06088.view.lkml"
include: "/views/domain_40/view_06090.view.lkml"
include: "/views/domain_41/view_06091.view.lkml"
include: "/views/domain_42/view_06092.view.lkml"

explore: explore_2029 {
  label: "Explore Explore 2029"
  description: "Comprehensive analytics explore joining base view_06088 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06088
  
  always_filter: {
    filters: [view_06088.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06088.created_at_date: "7 days"]
    unless: [view_06088.id, view_06088.status]
  }

  join: view_06090 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06088.user_id} = ${view_06090.id} ;;
    required_joins: []
  }

  join: view_06091 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06088.account_id} = ${view_06091.account_id} ;;
    required_joins: [view_06090]
  }

  join: view_06092 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06088.category} = ${view_06092.category} ;;
  }

  access_filter: {
    field: view_06088.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06088.is_deleted} = false ;;
}
