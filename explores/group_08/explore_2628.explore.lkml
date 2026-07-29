# Explore: explore_2628
# Auto-generated LookML Explore File

include: "/views/domain_35/view_07885.view.lkml"
include: "/views/domain_37/view_07887.view.lkml"
include: "/views/domain_38/view_07888.view.lkml"
include: "/views/domain_39/view_07889.view.lkml"

explore: explore_2628 {
  label: "Explore Explore 2628"
  description: "Comprehensive analytics explore joining base view_07885 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07885
  
  always_filter: {
    filters: [view_07885.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07885.created_at_date: "7 days"]
    unless: [view_07885.id, view_07885.status]
  }

  join: view_07887 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07885.user_id} = ${view_07887.id} ;;
    required_joins: []
  }

  join: view_07888 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07885.account_id} = ${view_07888.account_id} ;;
    required_joins: [view_07887]
  }

  join: view_07889 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07885.category} = ${view_07889.category} ;;
  }

  access_filter: {
    field: view_07885.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07885.is_deleted} = false ;;
}
